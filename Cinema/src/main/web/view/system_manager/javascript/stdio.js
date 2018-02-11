'use strict';
let array = {};
function find() {
    let table = document.getElementById('stdio');
    let length = table.rows[0].cells.length;
    let l = table.rows.length;
    for (let i = 0; i < l; i++) {
        if (i == 0) {
            let row = table.rows[i];
            row.setAttribute('class', 'active');
        }
        else {
            let row = table.rows[i];
            row.setAttribute('class', 'default');
        }
    }
    if (event.srcElement.tagName == 'TD') {
        let curRow = event.srcElement.parentElement;
        let num = curRow.rowIndex;
        if (curRow.rowIndex == 0) {
            curRow.setAttribute('class', 'warning');
            return 0;
        }
        else {
            curRow.setAttribute('class', 'info');

        }
        let arr = [];
        for (let i = 0; i < length; i++) {
            arr[i] = table.rows[num].cells[i].innerHTML;
        }

        array.num = num;
        array.table = table;
        array.n = length;
        array.info = arr;
        return array;
    }

}


function checkName() {
    let check = /^[\u4e00-\u9fa5]{2,9}$/;
    let nam = document.getElementById('name').value;
    if (check.test(nam)) {
        document.getElementById('1').innerText = '';
        return true;
    }
    else {
        document.getElementById('1').innerText = '请输入2～9个汉字！';
        document.getElementById('name').value = '';
        return false;
    }
}


function checkRow() {
    let r = document.getElementById('row').value;
    if (r>0&&r<=20) {
        document.getElementById('2').innerText = '';
        return true;
    }
    else {
        document.getElementById('2').innerText = '行数不为0且不超过20！';
        document.getElementById('row').value = '';
        return false;
    }
}

function checkCol() {
    let c = document.getElementById('col').value;
    if (c>0&&c<=20) {
        document.getElementById('3').innerText = '';
        return true;
    }
    else {
        document.getElementById('3').innerText = '列数不为0且不超过20！';
        document.getElementById('col').value = '';
        return false;
    }
}



function checkIntroduction() {
    let check = /^[\u4e00-\u9fa5]{2,9}$/;
    let intro = document.getElementById('introduction').value;
    if (check.test(intro)) {
        document.getElementById('4').innerText = '';
        return true;
    }
    else {
        document.getElementById('4').innerText = '请输入2～9个汉字！';
        document.getElementById('introduction').value = '';
        return false;
    }
}
function checkAll() {
    let add = document.getElementById('add');
    if (checkName()  && checkRow() && checkCol() && checkIntroduction()) {
        add.setAttribute('data-dismiss', 'modal');
        return true;
    }
    else {
        return false;
    }
}


