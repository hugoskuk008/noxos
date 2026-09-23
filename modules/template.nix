{config, lib, pkgs, ...}:

{

options = {
#nör?
my-option.enable = lib.mkEnableOption "beskrivning"; 

};

config = lib.mkif config.my-option.enable {
#vad göra



};

}






