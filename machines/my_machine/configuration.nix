{...}: {
  my_awesome_module.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "23.11";
}
