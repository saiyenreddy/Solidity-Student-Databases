// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "hardhat/console.sol";

contract studentregistry {
    struct student {
        uint id;
        string[] classes;
        uint[] gpa;
    }

    student[] private studentlist;

    function registerstudent(uint id) public {
        string[] memory classes;
        uint[] memory gpa;

        studentlist.push(student(id, classes, gpa));
    }

    function addclass(uint id, string memory newclass) public {
        for (uint i = 0; i < studentlist.length; i++) {
            if (studentlist[i].id == id) {
                studentlist[i].classes.push(newclass);
            }
        }
    }

    function getclasses(uint id) public view returns (string memory) {
        string memory allclasses = "";
        for (uint i = 0; i < studentlist.length; i++) {
            if (studentlist[i].id == id) {
                for (uint e = 0; e < studentlist[i].classes.length; e++) {
                    if (e > 0) {
                        allclasses = string.concat(allclasses, ",", studentlist[i].classes[e]);
                    } else {
                        allclasses = studentlist[i].classes[e];
                    }
                }
                return allclasses;
            }
        }
        return "";
    }

    function updategpa(uint id, uint newgrade) public {
        for (uint i = 0; i < studentlist.length; i++) {
            if (studentlist[i].id == id) {
                studentlist[i].gpa.push(newgrade);
            }
        }
    
    }
function getgpa(uint id) public view returns (uint) {
    uint finalgpa=0;
     for (uint i = 0; i < studentlist.length; i++) {
            if (studentlist[i].id == id) {
                for(uint e=0; e<studentlist[i].gpa.length;e++){
                finalgpa=finalgpa+studentlist[i].gpa[e];
                }
            return finalgpa/studentlist[i].gpa.length;
            }
     }
        return 0;
}
}