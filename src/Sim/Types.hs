module Sim.Types
       ( Board(..)
       , Status(..)
       , Player(..)
       , Move(..)
       , Vertex(..)
       , PlayerId(..)
       , Dim
       ) where

import Data.Text
import Text.Show.Functions

data Board = Board { playerA :: Player
                   , playerB :: Player
                   , status  :: Status
                   }
           deriving (Show)

type Dim = (Double, Double)

data Status = MoveA
            | HalfMoveA Vertex
            | MoveB
            | HalfMoveB Vertex
            | WinA
            | WinB
            deriving (Eq, Show)

data Player = Player { playerName :: Text
                     , playerId   :: PlayerId
                     , curMoves   :: [Move]
                     , validMoves :: [Move]
                     , makeMove   :: Player -> Move -> Player
                     }
            deriving (Show)

data PlayerId = A | B
              deriving (Enum, Eq, Show)

data Move = Line Vertex Vertex
          deriving (Show)

instance Eq Move where
  (==) (Line p q) (Line r s) | (p == r) && (q == s) = True
                             | (p == s) && (q == r) = True
                             | otherwise = False

data Vertex = One
            | Two
            | Three
            | Four
            | Five
            | Six
            deriving (Enum, Eq, Show)
