// core function
function Bubbles(container, self, options) {
    // options

    options = typeof options !== "undefined" ? options : {}
    animationTime = options.animationTime || 200 // how long it takes to animate chat bubble, also set in CSS
    typeSpeed = options.typeSpeed || 5 // delay per character, to simulate the machine "typing"
    widerBy = options.widerBy || 2 // add a little extra width to bubbles to make sure they don't break
    sidePadding = options.sidePadding || 6 // padding on both sides of chat bubbles
    recallInteractions = options.recallInteractions || 0 // number of interactions to be remembered and brought back upon restart
    inputCallbackFn = options.inputCallbackFn || true // should we display an input field?
    responseCallbackFn = options.responseCallbackFn || false // is there a callback function for when a user clicks on a bubble button

    var correct_answers = 0 // saves the count of right quiz answers
    var count = 0
    var answer_type = ""
    var freetext_answer_type = ""
    var standingAnswer = "ice" // remember where to restart convo if interrupted
    var _convo = {} // local memory for conversation JSON object
    //--> NOTE that this object is only assigned once, per session and does not change for this
    // 		constructor name during open session.

    // local storage for recalling conversations upon restart
    var localStorageCheck = function () {
        var test = "chat-bubble-storage-test"
        try {
            localStorage.setItem(test, test)
            localStorage.removeItem(test)
            return true
        } catch (error) {
            console.error(
                "Your server does not allow storing data locally. Most likely it's because you've opened this page from your hard-drive. For testing you can disable your browser's security or start a localhost environment."
            )
            return false
        }
    }
    var localStorageAvailable = localStorageCheck() && recallInteractions > 0
    var interactionsLS = "chat-bubble-interactions"
    var interactionsHistory =
        (localStorageAvailable &&
            JSON.parse(localStorage.getItem(interactionsLS))) ||
        []

    // prepare next save point
    interactionsSave = function (say, reply) {
        if (!localStorageAvailable) return
        // limit number of saves
        if (interactionsHistory.length > recallInteractions)
            interactionsHistory.shift() // removes the oldest (first) save to make space

        // do not memorize buttons; only user input gets memorized:
        if (
            // `bubble-button` class name signals that it's a button
            say.includes("bubble-button") &&
            // if it is not of a type of textual reply
            reply !== "reply reply-freeform" &&
            // if it is not of a type of textual reply or memorized user choice
            reply !== "reply reply-pick"
        )
            // ...it shan't be memorized
            return

        // save to memory
        interactionsHistory.push({say: say, reply: reply})
    }

    // commit save to localStorage
    interactionsSaveCommit = function () {
        if (!localStorageAvailable) return
        localStorage.setItem(interactionsLS, JSON.stringify(interactionsHistory))
    }

    // set up the stage
    container.classList.add("bubble-container")
    var bubbleWrap = document.createElement("div")
    bubbleWrap.className = "bubble-wrap"
    container.appendChild(bubbleWrap)

    // install user input textfield
    this.typeInput = function (callbackFn) {
        var inputWrap = document.createElement("div")
        inputWrap.className = "input-wrap"
        var inputText = document.createElement("textarea")
        inputText.setAttribute("placeholder", "Hier Text eingeben ... ")
        inputWrap.appendChild(inputText)
        inputText.addEventListener("keypress", function (e) {
            // register user input
            if (e.key === 'Enter') {
                e.preventDefault()
                typeof bubbleQueue !== false ? clearTimeout(bubbleQueue) : false // allow user to interrupt the bot
                var lastBubble = document.querySelectorAll(".bubble.say")
                lastBubble = lastBubble[lastBubble.length - 1]
                lastBubble.classList.contains("reply") &&
                !lastBubble.classList.contains("reply-freeform")
                    ? lastBubble.classList.add("bubble-hidden")
                    : false
                console.log("first ",freetext_answer_type)
                addBubble(
                    '<span class="bubble-button bubble-pick ' + freetext_answer_type + '">' + this.value + "</span>",
                    function () {
                    },
                    "reply reply-freeform"
                )
                // callback
                typeof callbackFn === "function"
                    ? callbackFn({
                        input: this.value,
                        convo: _convo,
                        standingAnswer: standingAnswer
                    })
                    : false
                this.value = ""
            }
        })
        container.appendChild(inputWrap)
        bubbleWrap.style.paddingBottom = "100px"
        inputText.focus()
    }
    inputCallbackFn ? this.typeInput(inputCallbackFn) : false

// init typing bubble
    var bubbleTyping = document.createElement("div")
    bubbleTyping.className = "bubble-typing imagine"
    for (dots = 0; dots < 3; dots++) {
        var dot = document.createElement("div")
        dot.className = "dot_" + dots + " dot"
        bubbleTyping.appendChild(dot)
    }
    bubbleWrap.appendChild(bubbleTyping)

    // accept JSON & create bubbles
    this.talk = function (convo, here, bool = undefined) {
        // all further .talk() calls will append the conversation with additional blocks defined in convo parameter
        result = ""
        if (bool !== undefined){
            result = count_right_answers(bool)
        }
        if (result !== ""){
            evaluate_quiz(result)
            return
        }
        _convo = Object.assign(_convo, convo) // POLYFILL REQUIRED FOR OLDER BROWSERS
        this.reply(_convo[here])
        here ? (standingAnswer = here) : false
    }

    this.return_quiz_result = function (){
        return correct_answers
    }

      this.set_answer_type = function (string, bool){
        if (string === "ft"){
            if (bool === true | bool === "true"){
                freetext_answer_type = "true-answer" // class for if a true answer was selected
            }
            else if (bool === false | bool === "false"){ // class for if a false answer was selected
                freetext_answer_type = "false-answer"
            }
        }
        else {
            if (bool === true | bool === "true"){
                answer_type = "true-answer" // class for if a true answer was selected
            }
            else if (bool === false | bool === "false"){ // class for if a false answer was selected
                answer_type = "false-answer"
            }
        }
          console.log(freetext_answer_type)
    }

    var iceBreaker = false // this variable holds answer to whether this is the initative bot interaction or not
    this.reply = function (turn) {
        iceBreaker = typeof turn === "undefined"
        turn = !iceBreaker ? turn : _convo.ice
        questionsHTML = ""
        if (!turn) return
        if (turn.reply !== undefined) {
            turn.reply.reverse()
            answer_type = ""
            for (var i = 0; i < turn.reply.length; i++) {
                ;(function (el, count) {
                    chatWindow.set_answer_type("",el.correct)
                    questionsHTML +=
                        '<span class="bubble-button" style="animation-delay: ' +
                        animationTime / 2 * count +
                        'ms" ' +
                        'onClick="' +
                        self +
                        ".answer('" +
                        el.answer +
                        "', '" +
                        el.question +
                        "', '" +
                        el.correct +
                        "');this.classList.add('bubble-pick');this.classList.add("+"'"+answer_type+"'"+")\">" +
                        el.question +
                        "</span>"
                })(turn.reply[i], i)
            }
        }
        orderBubbles(turn.says, function () {
            bubbleTyping.classList.remove("imagine")
            questionsHTML !== ""
                ? addBubble(questionsHTML, function () {
                }, "reply")
                : bubbleTyping.classList.add("imagine")
        })
    }
    // navigate "answers"
    this.answer = function (key, content, bool) {
        if (key.includes('chapter') || key === 'award') {
            result = count_right_answers(bool) // evaluates the answers
            if (result.includes('award')){
                evaluate_quiz(result)
            }
        }
        var func = function (key, content) {
            typeof window[key] === "function" ? window[key](content) : false
        }
        _convo[key] !== undefined
            ? (this.reply(_convo[key]), (standingAnswer = key))
            : (typeof responseCallbackFn === 'function' ? responseCallbackFn({
                input: key,
                convo: _convo,
                standingAnswer: standingAnswer
            }, key) : func(key, content))

        // add re-generated user picks to the history stack
        if (_convo[key] !== undefined && content !== undefined) {
            interactionsSave(
                '<span class="bubble-button reply-pick" >' + content + "</span>",
                "reply reply-pick"
            )
        }
    }

    // api for typing bubble
    this.think = function () {
        bubbleTyping.classList.remove("imagine")
        this.stop = function () {
            bubbleTyping.classList.add("imagine")
        }
    }

    // "type" each message within the group
    var orderBubbles = function (q, callback) {
        var start = function () {
            setTimeout(function () {
                callback()
            }, animationTime)
        }
        var position = 0
        for (
            var nextCallback = position + q.length - 1;
            nextCallback >= position;
            nextCallback--
        ) {
            ;(function (callback, index) {
                start = function () {
                    addBubble(q[index], callback)
                }
            })(start, nextCallback)
        }
        start()
    }
    // create a bubble
    var bubbleQueue = false
    var addBubble = function (say, posted, reply, live) {
        reply = typeof reply !== "undefined" ? reply : ""
        live = typeof live !== "undefined" ? live : true // bubbles that are not "live" are not animated and displayed differently
        var animationTime = live ? this.animationTime : 0
        var typeSpeed = live ? this.typeSpeed : 0
        // create bubble element
        var bubble = document.createElement("div")
        var bubbleContent = document.createElement("span")
        bubble.className = "bubble imagine " + (!live ? " history " : "") + reply
        bubbleContent.className = "bubble-content"
        bubbleContent.innerHTML = say
        bubble.appendChild(bubbleContent)
        bubbleWrap.insertBefore(bubble, bubbleTyping)
        // answer picker styles
        if (reply !== "") {
            var bubbleButtons = bubbleContent.querySelectorAll(".bubble-button")
            for (var z = 0; z < bubbleButtons.length; z++) {
                ;(function (el) {
                    if (!el.parentNode.parentNode.classList.contains("reply-freeform"))
                        el.style.width = el.offsetWidth - sidePadding * 2 + widerBy + "px"
                })(bubbleButtons[z])
            }
            bubble.addEventListener("click", function (e) {
                if (e.target.classList.contains('bubble-button')) {
                    for (var i = 0; i < bubbleButtons.length; i++) {
                        ;(function (el) {
                            el.style.width = 0 + "px"
                            el.classList.contains("bubble-pick") ? (el.style.width = "") : false
                            el.removeAttribute("onclick")
                        })(bubbleButtons[i])
                    }

                    this.classList.add("bubble-picked")
                }
            })
        }
        // time, size & animate
        wait = live ? animationTime * 2 : 0
        minTypingWait = live ? animationTime * 6 : 0
        if (say.length * typeSpeed > animationTime && reply == "") {
            wait += typeSpeed * say.length
            wait < minTypingWait ? (wait = minTypingWait) : false
            setTimeout(function () {
                bubbleTyping.classList.remove("imagine")
            }, animationTime)
        }
        live && setTimeout(function () {
            bubbleTyping.classList.add("imagine")
        }, wait - animationTime * 2)
        bubbleQueue = setTimeout(function () {
            bubble.classList.remove("imagine")
            var bubbleWidthCalc = bubbleContent.offsetWidth + widerBy + "px"
            bubble.style.width = reply == "" ? bubbleWidthCalc : ""
            bubble.style.width = say.includes("<img src=")
                ? "50%"
                : bubble.style.width
            bubble.classList.add("say")
            posted()

            // save the interaction
            interactionsSave(say, reply)
            !iceBreaker && interactionsSaveCommit() // save point

            // animate scrolling
            containerHeight = container.offsetHeight
            scrollDifference = bubbleWrap.scrollHeight - bubbleWrap.scrollTop
            scrollHop = scrollDifference / 200
            var scrollBubbles = function () {
                for (var i = 1; i <= scrollDifference / scrollHop; i++) {
                    ;(function () {
                        setTimeout(function () {
                            bubbleWrap.scrollHeight - bubbleWrap.scrollTop > containerHeight
                                ? (bubbleWrap.scrollTop = bubbleWrap.scrollTop + scrollHop)
                                : false
                        }, i * 5)
                    })()
                }
            }
            setTimeout(scrollBubbles, animationTime / 2)
        }, wait + animationTime * 2)
    }

    // recall previous interactions
    for (var i = 0; i < interactionsHistory.length; i++) {
        addBubble(
            interactionsHistory[i].say,
            function () {
            },
            interactionsHistory[i].reply,
            false
        )
    }
    var count_right_answers = function (bool) {
        if (bool === true || bool === "true") {
            correct_answers += 1
        }
        if (bool !== undefined && bool !== "undefined"){
            count += 1
        }
        console.log(count)
        if (count === 10) {
            if (correct_answers >= 9){
                result = "award1"
            }
            else if (correct_answers >= 7) {
                result = "award2"
            } else if (correct_answers >= 6) {
                result = "award3"
            } else if (correct_answers <= 5) {
                result = "award4"
            }
        }
        return result
    }
}

