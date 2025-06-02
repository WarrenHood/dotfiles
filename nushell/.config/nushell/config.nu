# Nushell Config File

# Disable welcome banner
$env.config.show_banner = false

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
