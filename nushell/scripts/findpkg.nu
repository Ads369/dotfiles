def "findpkg" [
    package_name: string # Name of the package to search for
] {
    let results = ($package_name | each { |package|
        let nix_output = (^nix eval $"nixpkgs#($package).version" | str trim)
        let nix_version = if ($nix_output | str starts-with "error:") { "N/A" } else { $nix_output | str substring 1..-2 }
        let brew_output = (^brew info $package | lines | first)
        let brew_version = if ($brew_output | str contains "Error: No available formula") { "N/A" } else { $brew_output | split row ":" | last | str trim }
        {package: $package, nix_version: $nix_version, brew_version: $brew_version}
    })

    $results
}
