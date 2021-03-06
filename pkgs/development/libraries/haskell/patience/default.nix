{ cabal }:

cabal.mkDerivation (self: {
  pname = "patience";
  version = "0.1.1";
  sha256 = "0qyv20gqy9pb1acy700ahv70lc6vprcwb26cc7fcpcs4scsc7irm";
  meta = {
    description = "Patience diff and longest increasing subsequence";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
