addTo (x:xs) n 0 = (let s = x + n in if x >= 0 then s else 0):xs
addTo (x:xs) n i = x : (addTo xs n (i - 1))

setTo (_:xs) n 0 = n:xs
setTo (x:xs) n i = x : (setTo xs n (i - 1))

execute [] state = displayState state
execute (c:cs) (ptr, bytes, stack) = 
    case c of '>' -> execute cs (ptr + 1, if length bytes > ptr + 1 then bytes else bytes ++ [0], stack)
              '<' -> execute cs (if ptr > 0 then ptr - 1 else 0, bytes, stack)
              '.' -> do putChar (bytes !! ptr); execute cs (ptr, bytes, stack)
              ',' -> do x <- getChar; execute cs (ptr, setTo bytes x ptr, stack) 
              '+' -> execute cs (ptr, addTo bytes 1 ptr, stack)
              '-' -> execute cs (ptr, addTo bytes (-1) ptr, stack)
              '[' -> if bytes !! ptr == 0 then 
              ']' -> if bytes !! ptr > 0 then let l:r = stack in execute (l ++ cs) (ptr, bytes, r) else execute cs (ptr, bytes, r)
                _ -> error "Invalid character"

displayState :: [Int] -> String
displayState (_, bytes, _) = map f bytes where f c = toEnum c :: char 

run :: String -> String
run s = execute s (0, [0], [])
