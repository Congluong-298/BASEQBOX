let speakerEnabled = true;

window.addEventListener("message", function (event) {
    var item = event.data;


    if (item.action === "update-ui-drop") {
        let listItem1 = document.getElementById("source-id-" + item.pid)
        if (listItem1) {
            listItem1.remove()
        }
    } else if (item.action === "update-ui-join") {
        let listItem1 = document.getElementById(`chanel-id-${item.mhz}`)
        if (listItem1) {
            $(`#chanel-id-${item.mhz} .main-playerlist`).append(`
                <div class="playerlist" id="source-id-${item.pid}">
                    <div class="radio-walkie"></div> ${item.name}
                </div>
            `)
        }
    }


    if (item.radioId != null) {
        let radioListElem = document.getElementById("radio-list");

        if (!radioListElem.firstChild) { //add radio list header
            let listHeader = document.createElement("div");

            listHeader.id = "radio-list-header";
            //listHeader.textContent = "\uD83D\uDCE1Radio List";
            listHeader.textContent = "\uD83D\uDCE1Radio " + item.channel;
            listHeader.style.textDecorationLine = "underline";

            radioListElem.appendChild(listHeader);


            $(".box-main").attr("id", `chanel-id-${item.channel}`)

            $(".main-content").append(`
						<div class="content-Mhz">${item.channel} Mhz</div>
						<div class="content-text">RADIO</div>
					`)
            $(".voice-advanced").show()
        }

        if (item.radioName != null) {
            //let listItem = document.createElement("div");

            //listItem.id = "radio-list-item-" + item.radioId;
            //listItem.textContent = item.radioName + (item.self ? "\uD83D\uDD38" : "\uD83D\uDD39");

            //let check = document.getElementById("radio-list-item-" + item.radioId)
            let chec1 = document.getElementById("source-id-" + item.radioId)
            if (chec1 === null) {
                //radioListElem.appendChild(listItem);
                $(".main-playerlist").append(`
                            <div class="playerlist ${item.self ? "head" : ""}" id="source-id-${item.radioId}">
                                <div class="radio-walkie"></div> ${item.radioName}
                            </div>
						`)
            }

        } else if (item.radioTalking != null) {
            //let listItem = document.getElementById("radio-list-item-" + item.radioId)
            let listItem1 = document.getElementById("source-id-" + item.radioId)

            if (item.radioTalking) {
                $(`#source-id-${item.radioId}`).addClass('active')
                // listItem1.addClass(`active`)
            } else {
                $(`#source-id-${item.radioId}`).removeClass('active')
                // listItem1.removeClass(`active`)
            }
        } else {
            //let listItem = document.getElementById("radio-list-item-" + item.radioId)
            let listItem1 = document.getElementById("source-id-" + item.radioId)
            // if (listItem && listItem1) {
            if (listItem1) {
                // $(".main-playerlist").empty()
                //radioListElem.removeChild(listItem);
                listItem1.remove()
            }

        }
    }

    if (item.clearRadioList) {
        let radioListElem = document.getElementById("radio-list");
        $(".main-content").empty()
        $(".main-playerlist").empty()
        $(".voice-advanced").hide()

        while (radioListElem.firstChild) {
            radioListElem.removeChild(radioListElem.firstChild);
        }
    }

    if (item.changeVisibility) {
        if (item.visible == true) {
            document.getElementById("show").style.display = 'block';
        } else if (item.visible == false) {
            document.getElementById("show").style.display = 'none';
        }
    }
});