/**
 * Created by ubuntu on 21/09/17.
 */

'use strict';
let array = {};
function find() {
    let table = document.getElementById('ss');
    let length = table.rows[0].cells.length;
    let l=table.rows.length;
    for(let i = 0;i<l;i++){
        if(i == 0){
            let row = table.rows[i];
            row.setAttribute('class','active');
        }
        else {
            let row = table.rows[i];
            row.setAttribute('class','default');
        }
    }
    if (event.srcElement.tagName == 'TD') {
        let curRow = event.srcElement.parentElement;
        let num = curRow.rowIndex;
        if(curRow.rowIndex == 0){
            curRow.setAttribute('class','warning');
            return 0;
        }
        else{
            curRow.setAttribute('class','info');

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


'use strict';


function checkNum(){
    let check=/^[0-9]{6,20}$/;
    let num=document.getElementById('number').value;
    if(check.test(num)){
        document.getElementById('1').innerText='';
        return true;
    }
    else{
        document.getElementById('1').innerText='请输入6～20位数字！';
        document.getElementById('number').value='';
        return false;
    }
}

function checkName(){
    let check=/[\u4e00-\u9fa5]{2,9}/;
    let nam=document.getElementById('name').value;
    if(check.test(nam)){
        document.getElementById('2').innerText='';
        return true;
    }
    else{
        document.getElementById('2').innerText='请输入2～9个汉字！';
        document.getElementById('name').value='';
        return false;
    }
}
function checkTel(){
    let check=/^1[3|4|5|7|8][0-9]{9}$/;
    let tele=document.getElementById('tel').value;
    if(check.test(tele)){
        document.getElementById('3').innerText='';
        return true;
    }
    else{
        document.getElementById('3').innerText='电话号码不符合格式！';
        document.getElementById('tel').value='';
        return false;
    }
}



function checkAddr(){
    let address=document.getElementById('addr').value;
    if(address!==''){
        document.getElementById('4').innerText='';
        return true;
    }
    else{
        document.getElementById('4').innerText='不能为空';
        document.getElementById('addr').value='';
        return false;
    }
}

function checkEmil(){
    let check=/^[a-zA-Z0-9_-]+@[a-z0-9]+(\.[a-z]{2,8}){1,2}$/;
    let email=document.getElementById('emil').value;
    if(check.test(email)){
        document.getElementById('5').innerText='';
        return true;
    }
    else{
        document.getElementById('5').innerText='邮箱不符合格式！';
        document.getElementById('emil').value='';
        return false;
    }
}

function checkAll(){
    let add=document.getElementById('add');
    if(checkNum()&&checkName()&&checkEmil()&&checkTel()&&checkAddr()){
        add.setAttribute('data-dismiss','modal');
        return true;
    }
    else
    {
        return false;
    }
}
