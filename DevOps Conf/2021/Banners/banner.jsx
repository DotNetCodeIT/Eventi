
//app.activeDocument.layerSets["Speaker"].layerSets["Room1"].visible = false;

$.evalFile ( "~/AzureDay2021/Banner/banner-data.jsx" );

app.displayDialogs = DialogModes.NO;
var doc = app.activeDocument;  
var filePath = activeDocument.fullName.path;  

var count = 0;

for(var session in sessions){  
    

    var roomnumber = sessions[session].roomnumber;
    var roomname = sessions[session].roomname;
    var sessiontime = sessions[session].sessiontime;
    var speakername = sessions[session].speakername;
    var speakerrole = sessions[session].speakerrole;
    var sessionlanguage = sessions[session].sessionlanguage;
    var sessionhashtag = sessions[session].sessionhashtag;
    var sessiontitle = sessions[session].sessiontitle;

    var build = sessions[session].build;
    var save = sessions[session].save;

    var sessiontimeroom = sessiontime.replace(":", "");

    
    var layerset = app.activeDocument.layerSets["Speaker"].layerSets[speakername]; 
    
    layerset.visible = false;
    count++;

};

debugger;

for(var session in sessions){  
    

    var roomnumber = sessions[session].roomnumber;
    var roomname = sessions[session].roomname;
    var sessiontime = sessions[session].sessiontime;
    var speakername = sessions[session].speakername;
    var speakerrole = sessions[session].speakerrole;
    var sessionlanguage = sessions[session].sessionlanguage;
    var sessionhashtag = sessions[session].sessionhashtag;
    var sessiontitle = sessions[session].sessiontitle;


    var build = sessions[session].build;
    var save = sessions[session].save;

    var sessiontimeroom = sessiontime.replace(":", "");

    if (save)
    {

        var layerset = app.activeDocument.layerSets["Speaker"].layerSets[speakername]; 

        layerset.visible = true;
        
        var pngFile = File(filePath + "/" + speakername +".png");
        var jpgFile = File(filePath + "/" + speakername +".jpg");
    
        var pngSaveOptions = new PNGSaveOptions();

        pngSaveOptions.embedColorProfile = true;
        pngSaveOptions.formatOptions = FormatOptions.STANDARDBASELINE;
        pngSaveOptions.matte = MatteType.NONE; 
        
        pngSaveOptions.quality = 1;

        var jpgSaveOptions = new JPEGSaveOptions();
        jpgSaveOptions.embedColorProfile = true;
        jpgSaveOptions.formatOptions = FormatOptions.STANDARDBASELINE;
        jpgSaveOptions.matte = MatteType.NONE;
        jpgSaveOptions.quality = 12;


        doc.saveAs(pngFile, pngSaveOptions, true, Extension.LOWERCASE);
        doc.saveAs(jpgFile, jpgSaveOptions, true, Extension.LOWERCASE);
        
        layerset.visible = false;
    }
    


};