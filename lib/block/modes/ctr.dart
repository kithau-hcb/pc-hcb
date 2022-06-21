// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastle_hcb.impl.block_cipher.modes.ctr;

import "package:pointycastle_hcb/api.dart";
import "package:pointycastle_hcb/adapters/stream_cipher_as_block_cipher.dart";
import "package:pointycastle_hcb/stream/ctr.dart";
import "package:pointycastle_hcb/src/registry/registry.dart";

class CTRBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig FACTORY_CONFIG = new DynamicFactoryConfig.suffix(
      BlockCipher,
      "/CTR",
      (_, final Match match) => () {
            BlockCipher underlying = new BlockCipher(match.group(1));
            return new CTRBlockCipher(
                underlying.blockSize, new CTRStreamCipher(underlying));
          });

  CTRBlockCipher(int blockSize, StreamCipher underlyingCipher)
      : super(blockSize, underlyingCipher);
}
