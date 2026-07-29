{ config, lib, pkgs, ... }: {
   services.pcscd.enable = true;
   services.udev.packages = [ pkgs.yubikey-personalization ];

   security.pam.u2f = {
      enable = true;
      settings = {
         origin = "pam://yubi";
         authfile = pkgs.writeText "u2f-mappings" ''
            madison:92SwuhPEMPLpB9+dy7atFkKv/QE+piSFlWXEnJEsTJLF4+4rmCMnVqEu/7l6lUaQdB/sFE8MkFfiBsMtTj8cqg==,D4XobXzKHA9M+vbzjJnS6Gjy6EyFQ07XvkxUKErCBlismUjSMgE9+T/x2JuuqvhTAjfCPWJ7ZIhFJdp8LuGxBg==,es256,+presence   
         '';
      };
   };

   security.pam.services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
   };
}
