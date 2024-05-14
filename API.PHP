<?php
$code = $_POST["code"];
if (!empty($code)) {
    if ($code == "662") {

        $output = shell_exec('python level1.py');

        $data = json_decode($output, true);

        if ($data['status'] == 'success') {
            $status = $data['status'];
            $message = $data['message'];
            $size = $data['size'];
            $words = $data['words'];
            $word_desc = $data['word_desc'];

            $res = array(
                "status" => $status,
                "message" => $message,
                "size" => $size,
                "words" => $words,
                "word_desc" => $word_desc
            );
        } else {
            echo "Error: " . $data['message'];
        }
    } elseif ($code == "663") {

        $output = shell_exec('python level2.py');

        $data = json_decode($output, true);

        if ($data['status'] == 'success') {
            $status = $data['status'];
            $message = $data['message'];
            $size = $data['size'];
            $words = $data['words'];
            $word_desc = $data['word_desc'];

            $res = array(
                "status" => $status,
                "message" => $message,
                "size" => $size,
                "words" => $words,
                "word_desc" => $word_desc
            );
        } else {
            echo "Error: " . $data['message'];
        }
    } elseif ($code == "664") {
        $output = shell_exec('python level3.py');

        $data = json_decode($output, true);

        if ($data['status'] == 'success') {
            $status = $data['status'];
            $message = $data['message'];
            $size = $data['size'];
            $words = $data['words'];
            $word_desc = $data['word_desc'];

            $res = array(
                "status" => $status,
                "message" => $message,
                "size" => $size,
                "words" => $words,
                "word_desc" => $word_desc
            );
        } else {
            echo "Error: " . $data['message'];
        }
    } elseif ($code == "665") {
        $output = shell_exec('python level4.py');

        $data = json_decode($output, true);

        if ($data['status'] == 'success') {
            $status = $data['status'];
            $message = $data['message'];
            $size = $data['size'];
            $words = $data['words'];
            $word_desc = $data['word_desc'];

            $res = array(
                "status" => $status,
                "message" => $message,
                "size" => $size,
                "words" => $words,
                "word_desc" => $word_desc
            );
        } else {
            echo "Error: " . $data['message'];
        }
    } elseif ($code == "666") {
        $output = shell_exec('python level5.py');

        $data = json_decode($output, true);

        if ($data['status'] == 'success') {
            $status = $data['status'];
            $message = $data['message'];
            $size = $data['size'];
            $words = $data['words'];
            $word_desc = $data['word_desc'];

            $res = array(
                "status" => $status,
                "message" => $message,
                "size" => $size,
                "words" => $words,
                "word_desc" => $word_desc
            );
        } else {
            echo "Error: " . $data['message'];
        }
    }
} else {
    $res = array("status" => "failed", "message" => "no code provided");
}
echo json_encode($res);
