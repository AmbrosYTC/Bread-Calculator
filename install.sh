#!/bin/bash

# Define the installation directory
INSTALL_DIR="/opt/bread_recipe"

# Create the installation directory
sudo mkdir -p "$INSTALL_DIR"
sudo chown "$USER:$USER" "$INSTALL_DIR"

# Copy the Python script and icon to the installation directory
sudo cp breadv3.py "$INSTALL_DIR"
sudo cp 4241664.png "$INSTALL_DIR"

# Create the run script
echo "#!/bin/bash" | sudo tee "$INSTALL_DIR/run_breadv3.sh" > /dev/null
echo "DIR=\$(dirname \"\$(readlink -f \"\$0\")\")" | sudo tee -a "$INSTALL_DIR/run_breadv3.sh" > /dev/null
echo "/usr/bin/env python3 \"\$DIR/breadv3.py\"" | sudo tee -a "$INSTALL_DIR/run_breadv3.sh" > /dev/null
sudo chmod +x "$INSTALL_DIR/run_breadv3.sh"

# Create the desktop entry file
echo "[Desktop Entry]" | sudo tee /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Name=Bread Recipe" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Comment=Calculate bread ingredient measurements" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Exec=$INSTALL_DIR/run_breadv3.sh" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Icon=$INSTALL_DIR/4241664.png" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Terminal=false" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Type=Application" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null
echo "Categories=GTK;Utility;" | sudo tee -a /usr/share/applications/bread_recipe.desktop > /dev/null

# Update the desktop entry database
sudo update-desktop-database

echo "Bread Recipe has been successfully installed."
echo "You can now find it in your application launcher or menu."

