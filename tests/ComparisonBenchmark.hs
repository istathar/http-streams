--
-- Benchmark code: compare http-streams and http-conduit
--
-- Copyright © 2012-2013 Operational Dynamics Consulting, Pty Ltd
--
-- The code in this file, and the program it is a part of, is made
-- available to you by its authors as open source software: you can
-- redistribute it and/or modify it under a BSD licence.
--

{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS -fno-warn-unused-do-bind #-}

import Criterion.Main
import GHC.Conc

{-
    The actual sample request code are in separate moduels to avoid
    namespace collision nightmares.
-}

import StreamsSample (sampleViaHttpStreams)
import ConduitSample (sampleViaHttpConduit)

main :: IO () 
main = do
    GHC.Conc.setNumCapabilities 4
    defaultMain
       [bench "http-streams" (sampleViaHttpStreams),
        bench "http-conduit" (sampleViaHttpConduit)]
    putStrLn "Complete."
