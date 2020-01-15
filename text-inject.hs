main = do
    print $ parse "Hello World my name is (NAME)"

parse "" = ""
parse ('(':rest) = env "" rest
parse ('\\':'(':rest) = '(': parse rest
parse (x:xs) = x: parse xs

env n (')':rest) = getvar n ++ parse rest
env n (m:rest) = env (n ++ [m]) rest

getvar n = "ENVVAR"
