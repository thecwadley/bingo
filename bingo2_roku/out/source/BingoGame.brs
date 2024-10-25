function BingoGame() As Object
    this = {}
    this.greeting = "Let's play Bingo!"
    this.farewell = "The End!"
    this.numbers = []
    this.futureNumbers = []
    this.pastNumbers = []
    this.numberOfNumbers = 5
    this.shuffle = function(arr)
        i = arr.Count()
        j = 0
        temp = 0
        while (i > 0)
            i = i - 1
            j = Int(RND(0) * (i + 1))
            temp = arr[j]
            arr[j] = arr[i]
            arr[i] = temp
        end while
        return arr
    end function
    this.initialize = Function() as Void
        m.numbers = []
        m.futureNumbers = []
        m.pastNumbers = []
        nText = ""
        for i = 0 to m.numberOfNumbers - 1
            m.numbers.Push(i)
            nText = nText + i.toStr()
        end for
        m.numbers = m.shuffle(m.numbers)
        m.numbers.Push(-1)
        for each number in m.numbers
            m.futureNumbers.Push(number)
        end for
        print m.numbers
        print m.futureNumbers
    end function
    this.setIndex = Function(index as Integer) as Void
        m.futureNumbers = []
        for each number in m.numbers
            m.futureNumbers.Push(number)
        end for
        m.pastNumbers = []
        for i = 0 to index - 1
            m.pastNumbers.unshift(m.futureNumbers[0])
            m.futureNumbers.shift()
        end for
    end function
    this.getIndex = Function() as integer
        return m.pastNumbers.Count()
    end function
    this.nextNumber = Function() as Integer
        if m.futureNumbers.Count() > 0
            m.setIndex(m.getIndex() + 1)
        end if
    end function
    this.prevNumber = Function() as Integer
        print m.pastNumbers.Count()
        if m.pastNumbers.Count() > 0
            m.setIndex(m.getIndex() - 1)
        end if
    end function
    this.intToBingo = Function(number as integer) as string
        newText = ""
        range = int(number / 15)
        if range = -1
            newText = m.farewell
        elseif range = 0
            newText = "B " + (number + 1).toStr()
        elseif range = 1
            newText = "I " + (number + 1).toStr()
        elseif range = 2
            newText = "N " + (number + 1).toStr()
        elseif range = 3
            newText = "G " + (number + 1).toStr()
        else
            newText = "O " + (number + 1).toStr()
        end if
        return newText
    end function
    this.getBingoValue = Function(index as integer) as string
        if m.pastNumbers.Count() > index
            return m.intToBingo(m.pastNumbers[index])
        else if index = 0
            return m.greeting
        else if index > 0
            return ""
        end if
    end function
    return this
end function
'//# sourceMappingURL=./BingoGame.brs.map