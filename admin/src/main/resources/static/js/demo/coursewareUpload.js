var $list_branchSchoolAttachment = $('#thelist_branchSchoolAttachment'),
    $btn_branchSchoolAttachment = $('#ctlBtn_branchSchoolAttachment'),
    state_branchSchoolAttachment = 'pending',
    uploader_branchSchoolAttachment;
var loadIndex;
// 当有文件被添加进队列的时候
//初始化Web Uploader
uploader_branchSchoolAttachment = WebUploader.create({

    // swf文件路径
    //swf: '${projectPath }/js/Uploader.swf',

    // 文件接收服务端。
    server: uploadUrl + '/UploadServlet',
    formData: {
        itNum: itNum
    },
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: {
        id: '#picker_branchSchoolAttachment',
        multiple: false
    },
    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false,
    fileSingleSizeLimit: 1024 * 1024 * 500,
    fileNumLimit: 1,
    accept: {
        extensions: 'mp3,mp4,ppt,pptx,pdf,jpg,doc,docx'
    }
});

// 文件上传过程中创建进度条实时显示。
uploader_branchSchoolAttachment.on('uploadProgress', function (file, percentage) {
    // console.log(percentage);

    var $li = $('#' + file.id),
        $percent = $li.find('.progress .progress-bar');

    // 避免重复创建
    if (!$percent.length) {
        $percent = $('<div class="progress progress-striped active">' +
            '<div class="progress-bar" role="progressbar" style="width: 0%"><span></span></div>' +
            '</div>').appendTo($li).find('.progress-bar');
    }

    $li.find('p.state').text('上传中');

    $percent.css('width', percentage * 100 + '%');
    $percent.find('span').text((percentage * 100).toFixed(2) + '%');
});
uploader_branchSchoolAttachment.on('fileQueued', function (file) {

    if (file.ext != 'mp4' && file.ext!='MP4' && file.ext != 'jpg' && file.ext != 'MP3' && file.ext != 'mp3') {
        //切换上传链接
        uploader_branchSchoolAttachment.options.server = backUploadUrl;
        //alert(uploader_branchSchoolAttachment.options.server)
        //url = '/coursewareUploadServlet'
    }
    $list_branchSchoolAttachment.append('<div id="' + file.id + '" class="item">' +
        '<h4 class="info">' + file.name + '</h4>' +
        '<p class="state">等待上传...</p>' +
        '</div>');
});
//文件成功、失败处理
uploader_branchSchoolAttachment.on('uploadSuccess', function (file, response) {
    if (response.state == 'SUCCESS') {
        $('#' + file.id).find('p.state').text('已上传');
        //如果coursewareId有值，表示上传的是ppt pdf jpg word
        if (response.coursewareId) {
            $list_branchSchoolAttachment.append('<input type="hidden" name="id" id="coursewareId" value="' + response.coursewareId + '">');
        }
        $list_branchSchoolAttachment.append('<input type="hidden" id="videoPath" name="videoPath" value="' + response.url + '">');
        $list_branchSchoolAttachment.append('<input type="hidden" name="mimetype" value="' + file.type + '">');
    } else {
        $('#' + file.id).find('p.state').text(response.state);
    }
});

uploader_branchSchoolAttachment.on('uploadError', function (file) {
    $('#' + file.id).find('p.state').text('上传出错');
    parent.layer.close(loadIndex);
});

uploader_branchSchoolAttachment.on('uploadComplete', function (file) {
    $('#' + file.id).find('.progress').fadeOut();
    parent.layer.close(loadIndex);
});

uploader_branchSchoolAttachment.on('uploadBeforeSend', function (obj, data, headers) {
    loadIndex = parent.layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
});
uploader_branchSchoolAttachment.on('all', function (type) {
    if (type === 'startUpload') {

        state_branchSchoolAttachment = 'uploading';
    } else if (type === 'stopUpload') {
        state_branchSchoolAttachment = 'paused';
    } else if (type === 'uploadFinished') {
        state_branchSchoolAttachment = 'done';
    }

    if (state_branchSchoolAttachment === 'uploading') {
        $btn_branchSchoolAttachment.text('暂停上传');
    } else {
        $btn_branchSchoolAttachment.text('开始上传');
    }
});

$btn_branchSchoolAttachment.on('click', function () {
    //判断

    if (state_branchSchoolAttachment === 'uploading') {
        uploader_branchSchoolAttachment.stop();
    } else {
        uploader_branchSchoolAttachment.upload();

    }
});