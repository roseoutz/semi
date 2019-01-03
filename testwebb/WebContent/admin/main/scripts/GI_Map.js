
//사용중인 파일 : /Text_User/RA_GI_Read.asp
//usw:역세권대분류
//csw:역세권 
//meter:거리

//SmartMap 역세권 검색
var map_host = "http://map.jobkorea.co.kr";

function go_SmartMap_Subway(usw, uswn, csw, cswn, meter) {
    if (meter <= 6) {
        meter = 6
    }    
    
    var mapurl = map_host + "/map/subway.asp?rusw=" + (usw + "&ruswn=" + escape(uswn) + "&rcsw=" + csw + "&rcswn=" + escape(cswn) + "&rmeter=" + meter);
    
    window.open(mapurl, "smartmap");
}

function go_SmartMap_Address(address, postno, xposition, yposition) {
    var mapurl = map_host + "/map/recruit.asp?xposition=" + xposition + "&yposition=" + yposition + "&address=" + escae(address) + "&postno=" + postno;
    window.open(mapurl, "smartmap");
}

function go_SmartMap_Address_M(address, postno) {    
    var mapurl = map_host + "/map/address.asp?address=" + escape(address) + "&postno=" + postno;
    window.open(mapurl, "smartmap");
}