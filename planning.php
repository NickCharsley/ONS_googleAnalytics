<?php

    include_once("ons_common.php");
    
    
    
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans pre95","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 1995","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 1996","","H:\\planning");
    
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 1997","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 1998","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 1999","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2000","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2002","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2003","","H:\\planning");
    //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2004","","H:\\planning");
    function getPage($href){
        $page="";
        if (strpos($href,"www.")===false){
            $page=@file_get_contents($href);
        }
        else {    
            $href=str_replace(' ','%20',$href);
            $req =& new HTTP_Request($href);
            if (PEARError($req->sendRequest())) {
                $page=$req->getResponseBody();
            }
            
        }
        $links=extractLinks($page);
        return $links;
    }

    function getHref(&$item)
    {
        if (!(strpos($item,"HREF=")===false)){
            $item=substr($item,strpos($item,"HREF=")+6);
            $item=substr($item,0,strpos($item,'"'));
        }
    }

    function extractLinks($page){
        $links=array();
        $page=strtoupper($page);
        while (!(strpos($page,"<A ")===false)){
            $page=substr($page,strpos($page,"<A "));
            $links[]=substr($page,0,strpos($page,">")-strpos($page,"<A "));
            $page=substr($page,strpos($page,">")+1);
        }
        array_walk($links, 'getHref');        
        return $links;
    }

    function getSubLinks($root){
                
        $href=$root[0]."/".$root[1]."/".$root[2];
        //$href=str_replace("//","/",$href);
        $gp= getPage($href);
        $links['Link']=array();
        foreach ($gp as $link){
            if (!(strpos($link,strtoupper($root[1])."/")===false)) {
                if (substr($link,-4)=='.PDF') $links['PDF'][]=$link;
                else $links['Link'][]=$link;
            }
        }
        //print_pre($links);
        foreach ($links['Link'] as $dir_link){
            //Make Directory and then parse
            $path=buildpath($root[3],$dir_link);
            @mkdir($path,0777,true);
            $root[1]=$dir_link;
            $links=array_merge_recursive($links,getSubLinks($root));
        }
        return $links;
    }
    
    function copyLinks($links,$root){
        print_pre($links);
        /**/
        foreach($links['PDF'] as $pdf)
        {
            $dest  =buildpath($root[3],$pdf);
            @mkdir(dirname($dest),0777,true);
            
            if (!file_exists($dest)){
                $source=str_replace(' ','%20',buildpath($root[0],$pdf));
                @copy($source,$dest);
            }
        }
        /**/
    }
	$base=dirname(__FILE__);
	//die($base);
      //$index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2002/02 01000 - 02 01999/02 01100 - 02 01199","",$base);
      $index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/plans 2001/01 01000 - 01 01999/01 01800 - 01 01899","",$base);
      copyLinks(getSubLinks($index),$index);
/** /
    for($year=2011;$year<2013;$year++){
        $index=array("http://www.portal.bedford.gov.uk","internet/environment/planning/planning applications/Decision Notices and Associated Appeal decisions/$year","","H:\\planning");
        copyLinks(getSubLinks($index),$index);
    }   
/**/
?>
