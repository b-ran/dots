{ pkgs, ... }:

{
  imports =
    (import ../../home) ++
    (import ../../home/services) ++
    (import ../../home/programs/apps) ++
    (import ../../home/programs/desktop) ++
    (import ../../home/programs/cli);
}
