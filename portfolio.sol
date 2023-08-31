// SPDX-License-Identifier: GPL-3.0

//0x082FAe7B417f7f225091bA1EdA479d2bf24C10E2

pragma solidity >=0.7.0 <0.9.0;

contract Portfolio {

    struct Project {
        uint id;
        string name;
        string description;
        string image;
        string githublink;
    }
    struct Education {
        uint id;
        string date;
        string degree;
        string knowledge;
        string institutionName;
    }
    Project[5] public projects;
    Education[5] public educationDetails;

    string public imagelink = "Qmcq5mDHPxsmrdcAShNRZh34ymFNLKwxMQgLz2oVDjUDaQ";
    string public description = "Fresher with 2 months of experience:";
    string public resumeLinks = "QmPQ881ggJdF6Mhp7UnCkXksn3c8Uec3HZuPNBCXHgKAKd";

    uint projectCount;
    uint educationCount;

    address public manager;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(manager == msg.sender, "you are not the manager:");
        _;
    }

    function insertProject(
        string calldata _name,
        string calldata _description,
        string calldata _image,
        string calldata _githublink
    ) external onlyManager{
        require(projectCount < 5, "only 5 project required:");
        projects[projectCount] = Project(
            projectCount,
            _name,
            _description,
            _image,
            _githublink
        );
        projectCount++;
    }
     function changeProject(
        string calldata _name,
        string calldata _description,
        string calldata _image,
        string calldata _githublink,    
        uint _projectCount
    ) external onlyManager{
        require(_projectCount>=0 && _projectCount<5, "only 5 project allowed:");
        projects[projectCount] = Project(
            _projectCount,
            _name,
            _description,
            _image,
            _githublink
        );
    }
    function allProject()external view returns (Project[5] memory){
        return projects;
        

    }

    function insertEducation(
        string calldata _date,
        string calldata _degree,
        string calldata _knowledge,
        string calldata _institutionName
    ) external onlyManager {
        require(educationCount < 5, "only 5 education required:");
        educationDetails[educationCount] = Education(
            educationCount,
            _date,
            _degree,
            _knowledge,
            _institutionName
        );
        educationCount++;
    }
    function changeEducation(
        string calldata _date,
        string calldata _degree,
        string calldata _knowledge,
        string calldata _institutionName,
        uint _educationDetailsCount

    ) external onlyManager {
        require(_educationDetailsCount >=0 && _educationDetailsCount<5, "Invalid count:");
        educationDetails[_educationDetailsCount] = Education(
            _educationDetailsCount,
            _date,
            _degree,
            _knowledge,
            _institutionName
        );
    }
    function allEducationDetails() external view returns(Education[5] memory){
        return educationDetails;

    }

    function changeDescription(string calldata _description)external{
        description=_description;
    }

    function changeResume(string calldata _resumeLinks)external onlyManager{
        resumeLinks=_resumeLinks;
    }
    function changeimage(string calldata _imagelink)external onlyManager{
        imagelink=_imagelink;
    }

    function donate() public payable{
        payable(manager).transfer(msg.value);
    }


}
