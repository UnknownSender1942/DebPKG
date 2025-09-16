#! /bin/bash
# DebPKG Tool v1

echo "
      _
 ___ | |__ ___
| . \| / // . |
|  _/|_\_\\_. |
|_|       <___'" | lolcat

# --- Functions ---
update_system() {
  echo "┌───────────────────────────────┐"
  echo "│ Updating System..             │"
  echo "└───────────────────────────────┘"
  sudo nala update
}

upgrade_system() {
  echo "┌───────────────────────────────┐"
  echo "│ Upgrading System..            │"
  echo "└───────────────────────────────┘"
  sudo nala upgrade
}

full_upgrade() {
  echo "┌───────────────────────────────┐"
  echo "│ Doing Full-Upgrade            │"
  echo "└───────────────────────────────┘"
  sudo nala full-upgrade
}

install_pkg() {
  echo "┌───────────────────────────────┐"
  echo "│ Enter package name to install │"
  echo "└───────────────────────────────┘"
  read -p "> " pkg
  [ -n "$pkg" ] && sudo nala install "$pkg" || echo "No package entered."
}

remove_pkg() {
  echo "┌───────────────────────────────┐"
  echo "│ Enter package name to remove  │"
  echo "└───────────────────────────────┘"
  read -p "> " pkg
  [ -n "$pkg" ] && sudo nala remove "$pkg" || echo "No package entered."
}

purge_pkg() {
  echo "┌───────────────────────────────┐"
  echo "│ Enter package name to purge   │"
  echo "└───────────────────────────────┘"
  read -p "> " pkg
  [ -n "$pkg" ] && sudo nala purge "$pkg" || echo "No package entered."
}

auto_remove() {
  echo "┌───────────────────────────────┐"
  echo "│ Removing PKGs not Required    │"
  echo "└───────────────────────────────┘"
  sudo nala autoremove
}

auto_purge() {
  echo "┌───────────────────────────────┐"
  echo "│ Purging PKGs not Required     │"
  echo "└───────────────────────────────┘"
  sudo nala autopurge
}

list_pkgs() {
  echo "┌───────────────────────────────┐"
  echo "│ Listing Packages in Repo      │"
  echo "└───────────────────────────────┘"

}

clean_cache() {
  echo "┌───────────────────────────────┐"
  echo "│ Cleaning cache in Archive     │"
  echo "└───────────────────────────────┘"
  sudo nala clean
}

fetch_mirrors() {
  echo "┌───────────────────────────────┐"
  echo "│ Fetching Fastest Mirrors      │"
  echo "└───────────────────────────────┘"
  sudo nala fetch
}

pkg_info() {
  echo "┌───────────────────────────────┐"
  echo "│ Enter package name for Info   │"
  echo "└───────────────────────────────┘"
  read -p "> " pkg
  [ -n "$pkg" ] && nala show "$pkg" || echo "No package entered."
}

search_pkg() {
  echo "┌───────────────────────────────┐"
  echo "│ Enter package name to Search  │"
  echo "└───────────────────────────────┘"
  read -p "> " pkg
  [ -n "$pkg" ] && nala search "$pkg" || echo "No package entered."
}

pkg_history() {
  echo "┌───────────────────────────────┐"
  echo "│ Showing PKG history           │"
  echo "└───────────────────────────────┘"
  nala history
}

# --- Menu ---
while true; do
  echo
  echo "1.  Update System" | lolcat
  echo "2.  Upgrade System" | lolcat
  echo "3.  Full Upgrade" | lolcat
  echo "4.  Install Package" | lolcat
  echo "5.  Remove Package" | lolcat
  echo "6.  Purge Package" | lolcat
  echo "7.  Auto Remove Packages not Required" | lolcat
  echo "8.  Auto Purge Packages not Required" | lolcat
  echo "9.  List All Packages in Deb/Ubuntu Repo" | lolcat
  echo "10. Clean Cache" | lolcat
  echo "11. Fetch Mirrors" | lolcat
  echo "12. Search For a Package" | lolcat
  echo "13. Package Info" | lolcat
  echo "14. Package Manager History" | lolcat
  echo "15. Exit" | lolcat
  echo "-------------------------------"
  read -p "Choose an option: " choice

  case $choice in
  1) update_system ;;
  2) upgrade_system ;;
  3) full_upgrade ;;
  4) install_pkg ;;
  5) remove_pkg ;;
  6) purge_pkg ;;
  7) auto_remove ;;
  8) auto_purge ;;
  9) list_pkgs ;;
  10) clean_cache ;;
  11) fetch_mirrors ;;
  12) search_pkg ;;
  13) pkg_info ;;
  14) pkg_history ;;
  15)
    echo "I Use Debian BTW..."
    exit 0
    ;;
  *) echo "Invalid Choice!" ;;
  esac
done
