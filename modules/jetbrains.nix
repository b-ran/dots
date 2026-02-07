{ config, pkgs, inputs, ... }:

{
#  environment.systemPackages = with pkgs; [
#    (jetbrains.plugins.addPlugins jetbrains.idea [ "github-copilot" ])
#  ];
   environment.systemPackages = with pkgs; [
     jetbrains.idea
   ];
}
