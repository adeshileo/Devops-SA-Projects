// server.js (ESM)
import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3000;

let reviews = [ /* ...same as before... */ ];

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.get("/api/reviews", (req, res) => res.json(reviews));
app.post("/api/reviews", (req, res) => {
  const { title, author, rating, text } = req.body || {};
  if (!title || !author || !rating || !text) {
    return res.status(400).json({ error: "title, author, rating, and text are required" });
  }
  const review = {
    id: reviews.length ? Math.max(...reviews.map(r => r.id)) + 1 : 1,
    title: String(title).trim(),
    author: String(author).trim(),
    rating: Number(rating),
    text: String(text).trim(),
    createdAt: new Date().toISOString(),
  };
  reviews.unshift(review);
  res.status(201).json(review);
});

app.get("/api/health", (_req, res) => res.json({ status: "ok" }));

// Important: bind to 0.0.0.0 inside Docker
app.listen(PORT, "0.0.0.0", () => console.log(`Server on http://0.0.0.0:${PORT}`));
