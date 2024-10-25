function Bingo(data = {
    "numbers": [],
    "index": -1
} as object) as object
    this = {}

    if data = invalid
        data = {
            "numbers": [],
            "index": -1
        }
    end if

    this.greeting = "Let's play Bingo!"
    this.farewell = "The End!"
    this.prev0 = this.greeting
    this.prev1 = ""
    this.prev2 = ""

    this.numbers = []
    this.index = -1
    this.numberOfNumbers = 5

    this.getAsAssocArray = Function () as object
        return {
            "numbers": m.numbers,
            "index": m.index,
        }
    end function

    this.arrayHasIndex = Function (index as integer) as boolean
        return index >= 0 and index < m.numbers.count()
    end function

    this.indexIsValid = Function (index as integer) as boolean
        return m.arrayHasIndex(index) or index = -1
    end function

    this.intToBingo = Function (number as integer) as string
        bingoColumns = ["B", "I", "N", "G", "O", "F", "L", "I", "C", "K", "R", "U", "S", "H", "X", "E", "P", "T", "Q", "M", "A", "D", "J", "Z", "Y", "W"]
        newText = ""
        range = int(number / 15)
        if range = -1
            newText = m.farewell
        else
            newText = bingoColumns[range] + " " + (number + 1).toStr()
        end if
        return newText
    end function

    if data <> invalid and ((not data.doesExist("numbers")) or data["numbers"].count() = 0)
        for i = 0 to this.numberOfNumbers - 1
            this.numbers.push(i)
        end for
        i = this.numbers.count()
        j = 0
        temp = 0
        while (i > 0)
            i = i - 1
            j = Int(RND(0)*(i+1))
            temp = this.numbers[j]
            this.numbers[j] = this.numbers[i]
            this.numbers[i] = temp
        end while
        this.numbers.Push(-1)
    else
        this.numbers = data["numbers"]
        this.numberOfNumbers = this.numbers.count()
        if data.DoesExist("index") this.index = data["index"] else this.index = -1
    end if

    if this.arrayHasIndex(this.index) this.prev0 = this.intToBingo(this.numbers[this.index])
    if this.arrayHasIndex(this.index - 1) this.prev1 = this.intToBingo(this.numbers[this.index - 1])
    if this.arrayHasIndex(this.index - 2) this.prev2 = this.intToBingo(this.numbers[this.index - 2])

    return this
end function