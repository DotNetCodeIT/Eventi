$.evalFile ( "~/AzureDay2021/Banner/banner-data.jsx" );

var newImageLayerName = "newImage";

for(var session in sessions){  
    

    var roomnumber = sessions[session].roomnumber;
    //var roomname = sessions[session].roomname;
    var sessiontime = sessions[session].sessiontime;
    var speakername = sessions[session].speakername;
    var speakerrole = sessions[session].speakerrole;
    var sessionlanguage = sessions[session].sessionlanguage;
    var sessionhashtag = sessions[session].sessionhashtag;
    var sessiontitle = sessions[session].sessiontitle;
    var filename = sessions[session].filename;

    var build = sessions[session].build;
    var save = sessions[session].save;
    var forceimage = sessions[session].forceimage;

    var sessiontimeroom = sessiontime.replace(":", "");

    if (build)
    {
        //roomnumber+"-"+sessiontimeroom
        var layerset = app.activeDocument.layerSets["Speaker"].layerSets[speakername]; 
        layerset.layers["TitleSession"].textItem.contents = sessiontitle;
        layerset.layers["SpeakerName"].textItem.contents = speakername 
        layerset.layers["RoomName"].textItem.contents = speakerrole;

        if (filename)
        {

            var theLayer = layerset.layerSets["Immagine"].layers["img"];

            var newImageLayerNameExist = false;

            try {
                layerset.layerSets["Immagine"].artLayers[newImageLayerName];
                newImageLayerNameExist = true;
          }
          catch(e)
          {
            newImageLayerNameExist = false
          }

            
            if (!newImageLayerNameExist || forceimage)
            {
                var fileRef = new File("/Users/leonardodottavi/AzureDay2021/Banner" + filename)

                var fileDocRef = open(fileRef);
                // convert to RGB; convert to 8-bpc; merge visible
                fileDocRef.changeMode(ChangeMode.RGB);

                fileDocRef.bitsPerChannel = BitsPerChannelType.EIGHT;

                fileDocRef.artLayers.add();

                fileDocRef.mergeVisibleLayers();

                fileDocRef.artLayers[0].isBackgroundLayer = false

                fileDocRef.artLayers[0].name =newImageLayerName;
                fileDocRef.artLayers[0].resize(292, 292, AnchorPosition.TOPLEFT );

                fileDocRef.artLayers[0].duplicate(layerset.layerSets["Immagine"], ElementPlacement.PLACEATBEGINNING);
                fileDocRef.close(SaveOptions.DONOTSAVECHANGES);

                var imgLayer = layerset.layerSets["Immagine"].artLayers["img"];

                layerset.layerSets["Immagine"].artLayers[newImageLayerName].translate(imgLayer.bounds[0].value,imgLayer.bounds[1].value);

            }
        }
    }


};

debugger;


