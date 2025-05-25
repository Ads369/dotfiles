{
  description = "Ads Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          nixpkgs.config.allowUnfree = true; # Allow not OpesnSource


          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          # NIX pkgs
          environment.systemPackages = [
            # pkgs.thefuck
            pkgs.bat
            pkgs.btop
            pkgs.eza
            pkgs.fd
            pkgs.fzf
            pkgs.harper # grammary
            pkgs.jq # json
            pkgs.lazydocker
            pkgs.lazygit
            pkgs.libffi
            pkgs.mkalias
            pkgs.neovim
            pkgs.nerd-fonts._0xproto
            pkgs.nerd-fonts.dejavu-sans-mono
            pkgs.nerd-fonts.fira-code
            pkgs.nerd-fonts.hack
            pkgs.nerd-fonts.meslo-lg
            pkgs.nerd-fonts.ubuntu-mono
            pkgs.nerd-fonts.zed-mono
            pkgs.nil
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            pkgs.oh-my-zsh
            pkgs.poetry
            pkgs.pre-commit
            pkgs.rainfrog # sql manager
            pkgs.ripgrep
            pkgs.ruff
            pkgs.skhd
            pkgs.starship
            pkgs.stow
            pkgs.xh # test api
            pkgs.yazi # file mamager
            pkgs.zellij # new tmux
            pkgs.zoxide # new cd
          ];

          # HomeBrew
          homebrew = {
            enable = true;
            brews = [
              "ffmpeg"
              "font-zed-mono-nerd-font"
              "harfbuzz" # fix for ffmpeg
              "kubectl"
              "node"
              "postgresql"
              "prettier"
              "thefuck"
              "uv" # alternative poetry
              "wget"
              "zsh-autosuggestions"
              "zsh-syntax-highlighting"
              # "mas" # Mac App Store command-line interface
            ];
            casks = [
              "appcleaner"
              "dbeaver-community"
              "ghostty"
              "iina"
              "jordanbaird-ice"
              "karabiner-elements"
              "keepassxc"
              "keycastr"
              "maccy"
              "nikitabobko/tap/aerospace"
              "obsidian"
              "raycast"
              "shottr"
              "the-unarchiver"
              "visual-studio-code"
              "webtorrent"
              "wezterm"
              "zed"
            ];

            # Apps from AppStor
            # masApps = { };

            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;
          };

          # create allias for nix app
          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

          system.defaults = {
            dock.autohide = true;
            dock.mru-spaces = false;
            finder.AppleShowAllExtensions = true;
            finder.FXPreferredViewStyle = "clmv";
            screencapture.location = "~/Pictures/screenshots";
          };

          # services.nix-daemon.enable = true; # Auto upgrade nix package and the daemon service.
          nix.settings.experimental-features = "nix-command flakes"; # Necessary for using flakes on this system.
          system.configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version.
          system.stateVersion = 5; # Used for backwards compatibility, please read the changelog before changing. # $ darwin-rebuild changelog
          nixpkgs.hostPlatform = "aarch64-darwin";
          security.pam.services.sudo_local.touchIdAuth = true;

          # Auto cleanup
          nix.optimise.automatic = true;
          nix.gc = {
            automatic = true;
            interval = {
              Weekday = 0;
              Hour = 0;
              Minute = 0;
            };
            options = "--delete-older-than 30d";
          };

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;
          programs.zsh.enable = true; # default shell on catalina

          # programs.git = {
          #   enable = true;
          #   userName = "Leigh Gable";
          #   userEmail = "leighgable@gmail.com";
          # };


        };

    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."ads" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true; # Install Homebrew under the default prefix
              enableRosetta = true; # Apple Silicon Only
              user = "ads"; # User owning the Homebrew prefix
              autoMigrate = true; # Automatically migrate existing Homebrew installations
            };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."ads".pkgs;
    };
}
