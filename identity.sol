// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;


contract Identity {
    
    struct student {
    string name;
    uint class;}
    /*student public s1;

    constructor (uint _roll,string memory _name){
        s1.roll=_roll;
        s1.name=_name;
    }

    uint [4] public arr=[10,23,34,50];
    function setter (uint index,uint value) public {
        arr[index]=value;
    }
    uint [] public arrr;
    function pushelement(uint item) public {
        arrr.push(item);
    }
    function length() public view returns(uint){
        return arrr.length;
}
    bytes3 public b1;
    bytes2 public b2;

    uint[3] public arre;

    uint public count;
    function loop() public {
    while(count<arre.length){
        arre[count]=count;
        count++;

    }
    }
    uint256[3] public arre;

    uint256 public count;

    function loop() public {
        for (uint256 i = count; i < arre.length; i++) {
            arre[count] = count;
            count++;
        }
    }

    bool public value=true;
    enum user{ allowed,not_allowed,wait}
    user public u1=user.allowed;
    uint public loterry=1000;

    function owner() public{
        if(u1==user.allowed){
            loterry=0;
        }
    }*/

    mapping (uint=>student ) public data;

    function setter(uint _roll,string memory _name,uint _class) public {

        data[_roll]=student(_name,_class);
    }

    
}

