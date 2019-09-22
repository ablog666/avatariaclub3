<?php
_auth();
if (isset($routes['1'])) {
    $do = $routes['1'];
} else {
    $do = 'sys_cats';
}

switch ($do) {




    #################### All Ajax Post ###############################
    case 'reorder-post':
        $action = $_POST['action'];
        $updateRecordsArray = $_POST['recordsArray'];

        $listingCounter = 1;
        foreach ($updateRecordsArray as $recordIDValue) {

            $d = ORM::for_table($action)->find_one($recordIDValue);
            $d->sorder = $listingCounter;
            $d->save();
            $listingCounter = $listingCounter + 1;
        }

        echo '<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Success!</strong> New Positions are updated in database
</div>';
        break;


}