# Получаем имя пакета как аргумент
def main [pkg: string] {
    print $"🔍 Searching for ($pkg) in nixpkgs..."

    let nix_result = (nix search nixpkgs $pkg | complete)

    if $nix_result == "" {
        print "❌ Not found in Nix. Searching in Homebrew..."
        let brew_result = (brew search $pkg | lines)

        if ($brew_result | is-empty) {
            print "❌ Package not found in Homebrew either."
        } else {
            print $"✅ Found in Homebrew: ($brew_result)"
            print $"💡 Install with: brew install ($pkg)"
        }
    } else {
        print $"✅ Found in Nix:"
        print $nix_result

        # Извлекаем версии (если они указаны явно)
        let versions = ($nix_result | lines | find -r '[0-9]+\.[0-9]+')

        if not ($versions | is-empty) {
            print "📦 Versions found:"
            print $versions
        }

        print $"💡 Install with: nix profile install nixpkgs#($pkg)"
    }
}
