sub init()
    m.top.functionName = "processBingo"
    m.databaseActive = false
    m.failureCount = 0
end sub

function bingoIsSame(prevBingo)
    numbersEqual = true
        if prevBingo.numbers.count() <> m.top.bingo.numbers.count()
            numbersEqual = false
        end if
        for i = 0 to prevBingo.numbers.count() - 1 
            if prevBingo.numbers[i] <> m.top.bingo.numbers[i]
                numbersEqual = false
            end if
        end for
    return numbersEqual and prevBingo.index = m.top.bingo.index
end function

function processBingo() as void
    prevBingo = {
        "numbers": [],
        "index": 0,
    }
    while true
        sleep(1000)
        bingoSame = bingoIsSame(prevBingo)
        cloudBingo = {}
        if m.top.gameID <> ""
            cloudBingo = getGameFromFirebase()

            doNormalLogic = true

            if cloudBingo <> invalid
                numbersIsNOne = cloudBingo["numbers"].count() = 1 and cloudBingo["numbers"][0] = -1
                if cloudBingo["index"] = -1 and numbersIsNOne
                    bingoSame = false
                    doNormalLogic = false
                    getSuccess = true
                end if
            end if

            if doNormalLogic = true
                print "limbo: " + m.top.status
                if cloudBingo = invalid and m.top.status <> "limbo"
                    m.failureCount = m.failureCount + 1
                    getSuccess = false
                else if cloudBingo = invalid and (m.top.status = "" and m.top.gameID = "")
                    getSuccess = false
                else if bingoSame and cloudBingo <> invalid
                    prevBingo = cloudBingo
                    m.top.bingo = cloudBingo
                    m.failureCount = 0
                    m.top.status = ""
                    getSuccess = true
                else
                    m.failureCount = 0
                    getSuccess = true
                end if
            end if
        end if

        if not bingoSame
            prevBingo = m.top.bingo
            if m.top.gameID <> "" and cloudBingo <> invalid
                cloudSynced = addNewGameToFirebase(m.top.bingo)
                if not cloudSynced and m.top.status <> "limbo"
                    m.failureCount = m.failureCount + 1
                else
                    m.failureCount = 0
                    m.top.status = ""
                end if
            end if
        end if

        if m.failureCount > 10
            m.top.status = "limbo"
            m.failureCount = 0
        end if
    end while
end function

function prepareRequest()
    ' Replace with your actual Firebase database URL
    baseUrl = "https://bingo-75d49-default-rtdb.firebaseio.com/games"
    
    ' Unique game ID (you can generate one or use a UUID-like string)
    gameId = m.top.gameID  ' Replace with your actual unique game ID

    print m.top.gameID
    
    ' Firebase URL for the specific game node
    url = baseUrl + "/" + gameId + ".json"
        
    ' Create an instance of roUrlTransfer
    urlTransfer = CreateObject("roUrlTransfer")

    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.AddHeader("X-Roku-Reserved-Dev-Id", "")
    urlTransfer.InitClientCertificates()
    
    urlTransfer.setURL(url)
    urlTransfer.AddHeader("Content-Type", "application/json")
    return urlTransfer
end function

function getGameFromFirebase() as object
    urlTransfer = prepareRequest()
    urlTransfer.setRequest("GET")
    response = urlTransfer.getToString()
    
    ' Check for success or error
    if response <> invalid
        print "Game added successfully: "; response
        return ParseJson(response)
    else
        print "Error fetching game"
        return {}
    end if
end function

function addNewGameToFirebase(bingoGame) as boolean
    urlTransfer = prepareRequest()
    urlTransfer.setRequest("PUT")
    jsonString = FormatJson(bingoGame)
    response = urlTransfer.postFromString(jsonString)
    
    ' Check for success or error
    if response <> invalid
        print "Game added successfully: "; response
        return true
    else
        print "Error adding game"
        return false
    end if
end function