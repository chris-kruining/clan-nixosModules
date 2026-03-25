{
  lib,
  config,
  ...
}: let
  cfg = config.my_awesome_module;
in {
  options.my_awesome_module = {
    enable = lib.mkEnableOption "enable my awesome module";
  };

  config = lib.mkIf cfg.enable {
    networking.hostName = "AWSOME";
  };
}
