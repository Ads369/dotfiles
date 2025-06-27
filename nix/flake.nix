{
  description = "Ads Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          system.primaryUser = "ads";
          nixpkgs.config.allowUnfree = true; # Allow not OpesnSource
          users.users.ads.shell = pkgs.nushell;

          fonts.packages = with pkgs; [
            nerd-fonts._0xproto
            nerd-fonts.dejavu-sans-mono
            nerd-fonts.fira-code
            nerd-fonts.hack
            nerd-fonts.meslo-lg
            nerd-fonts.ubuntu-mono
            nerd-fonts.zed-mono
          ];

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          # NIX pkgs
          environment.systemPackages = with pkgs; [
            # nodejs
            # webtorrent-desktop
            aerospace
            appcleaner
            bat
            bruno # postman alternative
            btop
            eza
            fd
            ffmpeg
            fly # vostok-soft
            fzf
            grandperspective # storage cleaner
            harfbuzz # fix for ffmpeg
            harper # grammary
            iina
            jq # json
            karabiner-elements
            keepassxc
            keycastr
            kubectl
            lazydocker
            lazygit
            libffi
            maccy
            mas # Mac App Store command-line interface
            mkalias
            neovim
            nil
            nixd
            nixfmt-rfc-style
            nushell
            obsidian
            oh-my-zsh
            postgresql
            pre-commit
            rainfrog # sql manager
            raycast
            ripgrep
            ruff
            shottr
            starship
            stow
            taplo # LSP support for TOML
            the-unarchiver
            uv
            wget
            xh # test api
            yazi # file mamager
            zellij # new tmux
            zoxide # new cd
            zsh-autosuggestions
            zsh-syntax-highlighting
            betterdisplay
            docker
            # spotify
            spotify-qt
          ];

          # HomeBrew
          homebrew = {
            onActivation = {
              autoUpdate = true;
              upgrade = true;
              cleanup = "zap";
            };
            enable = true;

            brews = [
              # "font-zed-mono-nerd-font"
              # "harfbuzz" # fix for ffmpeg
              # "prettier"
              # "thefuck"
            ];
            casks = [
              "amneziavpn"
              "deepl"
              "dockdoor" # alternative alt-tab
              "jordanbaird-ice"
              "telegram"
              # "tor-browser"
              # "termius"
              # "applite" # gui for brew
              # "nikitabobko/tap/aerospace"
              # "dbeaver-community"
              # "visual-studio-code"
              # "wezterm"
            ];

            # Apps from AppStor
            masApps = {
              "RunCat" = 1429033973;
            };
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
              Weekday = 7;
              Hour = 0;
              Minute = 0;
            };
            options = "--delete-older-than 30d";
          };

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;
          # Enabling zsh at the system level for compatibility
          programs.zsh.enable = true; # default shell on catalina

          # programs.git = {
          #   enable = true;
          #   userName = "Dmitriy Aleksandrov";
          #   userEmail = "Adsis369@gmail.com";
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
          # home-manager.darwinModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.ads = import ./home.nix;
          # }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."ads".pkgs;
    };
}
