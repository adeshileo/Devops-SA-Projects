#!/bin/bash

# Define departments and users
declare -A departments=(
  ["dev"]="alice"
  ["qa"]="bob"
  ["ops"]="carol"
)

# Create groups and directoriess
for dept in "${!departments[@]}"; do
  echo "Creating group and directory for $dept..."
  groupadd -f $dept
  mkdir -p /projects/$dept
  chown :$dept /projects/$dept
  chmod 770 /projects/$dept

  user="${departments[$dept]}"
  echo "Creating user $user..."
  id $user &>/dev/null || useradd -m -G $dept $user
  echo "User $user added to group $dept."
done

# Add sudo privileges for ops team
echo "carol ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers
echo "Setup complete."

#!/bin/bash

# Define departments and users
declare -A departments=(
  ["dev"]="alice"
  ["qa"]="bob"
  ["ops"]="carol"
)

# Create groups and directories
for dept in "${!departments[@]}"; do
  echo "Creating group and directory for $dept..."
  groupadd -f $dept
  mkdir -p /projects/$dept
  chown :$dept /projects/$dept
  chmod 770 /projects/$dept

  user="${departments[$dept]}"
  echo "Creating user $user..."
  id $user &>/dev/null || useradd -m -G $dept $user
  echo "User $user added to group $dept."
done

# Add sudo privileges for ops team
echo "carol ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers
echo "Setup complete."
