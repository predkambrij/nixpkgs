{ stdenv, fetchurl, ... } @ args:

import ./generic.nix (args // rec {
  version = "3.13.11";
  extraMeta.branch = "3.13";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v3.x/linux-${version}.tar.xz";
    sha256 = "fcd2fe4039246480f43ec4b8c965a9b04c316e4061a88b9fd867656b412d11da";
  };

  features.iwlwifi = true;
  features.efiBootStub = true;
  features.needsCifsUtils = true;
  features.canDisableNetfilterConntrackHelpers = true;
  features.netfilterRPFilter = true;
} // (args.argsOverride or {}))
