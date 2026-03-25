{...}: {
  flake.nixosModules.my_awesome_module = {lib, ...}: {
    options = {
      enable = lib.mkEnableOption "enable my awesome module";
    };
  };
}
