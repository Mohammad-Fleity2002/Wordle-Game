<?php
$code = $_POST["code"];
if (!empty($code)) {
    if ($code == "662") {
        // Code 662 logic
    } elseif ($code == "666") {
        // Code 666 logic
    } elseif ($code == "663") {
        // Code 663 logic
    } elseif ($code == "664") {
        // Code 664 logic
    } elseif ($code == "665") {
        // Code 665 logic
    }
}

if (!empty($code) && ($code == "662" || $code == "666" || $code == "663" || $code == "664" || $code == "665")) {
    $query_words = "SELECT * FROM words ;";
    include("connection.php");
    $words_cursor = mysqli_query($conn, $query_words);
    mysqli_close($conn);
    $i = 0;
    if ($words_cursor) {
        if (
            ($nb_words = mysqli_num_rows($words_cursor)) != 0
        ) {
            while ($row = mysqli_fetch_array($words_cursor)) {
                $words["name" . $i] = $row["word"];
                $id_word["id" . $i] = $row["id"];
                $word_desc["desc" . $i] = $row["description"];
                $i++;
            };
            $res = array(
                "status" => "success",
                "message" => "words imported",
                "size" => $nb_words,
                "words" => $words,
                "id_word" => $id_word,
                "word_desc" => $word_desc
            );
        } else {
            $res = array("status" => "failed", "message" => "error");
        }
    } else {
        $res = array("status" => "failed", "message" => "error");
    }
} else {
    $res = array("status" => "failed", "message" => "no code provided");
}
echo json_encode($res);
