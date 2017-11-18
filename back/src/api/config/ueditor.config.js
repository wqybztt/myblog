const MB = 1024*1024;
module.exports =  {
    "imageActionName": "uploadimage", 
    "imageFieldName": "upfile",
    "imageMaxSize": MB, 
    "imageAllowFiles": [".png", ".jpg", ".jpeg", ".gif", ".bmp"], 
    "imageCompressEnable": true, 
    "imageCompressBorder": 1600, 
    "imageInsertAlign": "none", 
    // "imageUrlPrefix": "", 
    // "imagePathFormat": "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}",

    "scrawlActionName": "uploadscrawl", 
    "scrawlFieldName": "upfile", 
    // "scrawlPathFormat": "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}",
    "scrawlMaxSize": MB, 
    "scrawlUrlPrefix": "", 
    "scrawlInsertAlign": "none",

    // "snapscreenActionName": "uploadimage", 
    // "snapscreenPathFormat": "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", 
    // "snapscreenUrlPrefix": "", 
    // "snapscreenInsertAlign": "none", 

    // "catcherLocalDomain": ["127.0.0.1", "localhost", "img.baidu.com"],
    // "catcherActionName": "catchimage", 
    // "catcherFieldName": "source", 
    // "catcherPathFormat": "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", 
    // "catcherUrlPrefix": "", 
    // "catcherMaxSize": MB, 
    // "catcherAllowFiles": [".png", ".jpg", ".jpeg", ".gif", ".bmp"], 

    // "videoActionName": "uploadvideo", 
    // "videoFieldName": "upfile", 
    // "videoPathFormat": "/ueditor/php/upload/video/{yyyy}{mm}{dd}/{time}{rand:6}", 
    // "videoUrlPrefix": "", 
    // "videoMaxSize": 100*MB, 
    // "videoAllowFiles": [
    //     ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
    //     ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid"], 

    // "fileActionName": "uploadfile",
    // "fileFieldName": "upfile", 
    // "filePathFormat": "/ueditor/php/upload/file/{yyyy}{mm}{dd}/{time}{rand:6}", 
    // "fileUrlPrefix": "", 
    // "fileMaxSize": 50*MB, 
    // "fileAllowFiles": [
    //     ".png", ".jpg", ".jpeg", ".gif", ".bmp",
    //     ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
    //     ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid",
    //     ".rar", ".zip", ".tar", ".gz", ".7z", ".bz2", ".cab", ".iso",
    //     ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".pdf", ".txt", ".md", ".xml"
    // ],

    // "imageManagerActionName": "listimage", 
    // "imageManagerListPath": "/ueditor/php/upload/image/",
    // "imageManagerListSize": 20,
    // "imageManagerUrlPrefix": "", 
    // "imageManagerInsertAlign": "none", 
    // "imageManagerAllowFiles": [".png", ".jpg", ".jpeg", ".gif", ".bmp"], 

    // "fileManagerActionName": "listfile", 
    // "fileManagerListPath": "/ueditor/php/upload/file/",
    // "fileManagerUrlPrefix": "", 
    // "fileManagerListSize": 20, 
    // "fileManagerAllowFiles": [
    //     ".png", ".jpg", ".jpeg", ".gif", ".bmp",
    //     ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
    //     ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid",
    //     ".rar", ".zip", ".tar", ".gz", ".7z", ".bz2", ".cab", ".iso",
    //     ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".pdf", ".txt", ".md", ".xml"
    // ] 

}