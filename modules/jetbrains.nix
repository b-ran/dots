{ config, pkgs, inputs, ... }:

{
#  environment.systemPackages = with pkgs; [
#    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [ "github-copilot" ])
#  ];
   environment.systemPackages = with pkgs; [
     jetbrains.idea-ultimate
   ];
}
