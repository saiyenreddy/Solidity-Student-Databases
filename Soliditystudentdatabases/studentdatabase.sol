pragma solidity ^0.8.18;
import "hardhat/console.sol";
contract studentregistry{
    struct student{
        string name;
        string[] departments;
        string[] classes;
        uint[] grades;
        uint studentid;
    }

    student[] public studentlists;
function registerstudent(string memory name, string[] memory departments, uint studentid) public{
    string[] memory classes;
    uint[] memory grades;
  studentlists.push(student(name,departments,classes,grades,studentid));
}

function adddepartments(uint id,string memory newdepartment) public{
 uint indexnumber = 1000;
 for(uint i = 0 ;i<studentlists.length;i++){
    if(studentlists[i].studentid==id){
        indexnumber=i;
    }
 }
   require(indexnumber!=1000, "no id");
  

 studentlists[indexnumber].departments.push(newdepartment);
}
}