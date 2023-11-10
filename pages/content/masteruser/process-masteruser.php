<?php

    require '../../core/connection.php';

    $QueryGetListUser = mysqli_query($mysqli,'SELECT u.nik_tmu, u.name_tmu, u.address_tmu, u.gender_tmu FROM tbl_m_user u');

?>