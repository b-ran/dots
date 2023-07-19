{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [ "github-copilot" ])
  ];
}
