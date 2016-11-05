<?php

class driver extends Module
{
    var $driver = array (
        "first_name" => "",
        "last_name" => "",
        "father_name" => "",
        "passport_serial" => "",
        "passport_number" => "",
        "info" => ""
    );

    function is_all_params ()
    {
        foreach ($this -> driver as $name => $value) {
            if (!$this->data->is_param($name)) return false;
            $this->driver [$name] = $this->data->get($name);
        }
        return true;
    }

    public function api_insert ()
    {
        if (!$this -> data -> is_login (1)) return;
        $this -> answer ["saved"] = "";
        $this -> answer ["error"] = "";
        $this -> answer ["driver"] = $this -> driver;
        $user_id = $this -> data -> load ("user") ["id"];
        if (!$user_id)
            $this -> answer ["error"] = na("User not set");
    }

    public function api_insert_post ()
    {
        if (!$this -> data -> is_login (1)) return;
        if (!$this -> is_all_params ()) return;
        $this -> answer ["saved"] = "";
        $this -> answer ["error"] = "";
        $this -> answer ["driver"] = $this -> driver;
        $user_id = $this -> data -> load ("user") ["id"];

        $error = "";
        foreach ($this -> driver as $name => $value)
        {
            $this -> answer ["driver"] [$name] = $this -> data -> get($name);
            if ($this -> data -> get($name) == "")
                $error .= " " . $name . " not set";
        }
        if ($error != "")
        {
            $this->answer ["error"] = $error;
            return;
        }
        $query =
            "INSERT INTO drivers
                SET user_id = '" . $user_id . "',
                    last_name = '" . $this -> data -> get ("last_name") . "', 
                    first_name = '" . $this -> data -> get ("first_name") . "', 
                    father_name = '" . $this -> data -> get ("father_name") . "',
                    passport_serial = '" . $this -> data -> get ("passport_serial") . "', 
                    passport_number = '" . $this -> data -> get ("passport_number") . "',
                    info = '" . $this -> data -> get ("info") . "',
                    status = 1,
                    insert_date = NOW()";
        $this -> db -> query ($query);
        $this -> answer ["saved"] = true;
    }

    public function api_update ()
    {
        if (!$this -> data -> is_login (2)) return;
        if (!$this -> data -> is_param ("driver_id")) return;
        if (!$this -> exists ()) return;
        if (!$this -> is_all_params ()) return;
        $query =
            "UPDATE drivers
                SET last_name = '" . $this -> data -> get ("last_name") . "', 
                    first_name = '" . $this -> data -> get ("first_name") . "', 
                    father_name = '" . $this -> data -> get ("father_name") . "',
                    passport_serial = '" . $this -> data -> get ("passport_serial") . "', 
                    passport_number = '" . $this -> data -> get ("passport_number") . "',
                    update_date = NOW()
              WHERE id = '" . $this -> data -> get ("driver_id") . "' 
              LIMIT 1";
        $this -> db -> query ($query);
        $this -> answer = "Driver info changed";
    }

    public function api_confirm ()
    {
        if (!$this -> data -> is_login (2)) return;
        if (!$this -> data -> is_param ("driver_id")) return;
        if (!$this -> data -> is_param ("status")) return;
        if (!$this -> exists ()) return;
        $query =
            "UPDATE drivers
                SET status = '" . $this -> data -> get ("status") . "',
                    update_date = NOW()
              WHERE id = '" . $this -> data -> get ("driver_id") . "' 
              LIMIT 1";
        $this -> db -> query ($query);
        $this -> answer = "Driver status changed";
    }

    public function api_list ()
    {
        if (!$this -> data -> is_login (1)) return;
        if ($this -> data -> load ("user") ["status"] == "2")
            $user_cond = "1";
        else
            $user_cond = " user_id = '" . $this -> data -> load ("user") ["id"] . "'";
        $query =
            "SELECT id, insert_date, update_date, 
                    last_name, first_name, father_name,
                    passport_serial, passport_number,
                    status, info
               FROM drivers 
              WHERE $user_cond
           ORDER BY id DESC";
        $this -> answer ["list"] = $this -> db -> select ($query);
    }

    public function api_info ()
    {
        if (!$this -> data -> is_login (2)) return;
        if (!$this -> data -> is_param ("driver_id")) return;
        if (!$this -> exists ()) return;
        $query =
            "SELECT insert_date, update_date, 
                    last_name, first_name, father_name,
                    passport_serial, passport_number,
                    status, info
               FROM drivers 
              WHERE id = '" . $this -> data -> get ("driver_id") . "'";
        $this -> answer = $this -> db -> select ($query);
    }

    public function api_find ()
    {
        $this -> answer ["by"] = "";
        $this -> answer ["count"] = "";
    }

    public function api_find_post ()
    {
        if (!$this -> data -> is_login (-1)) return;
        if (!$this -> data -> is_param ("by", na("Search criteria not specified"))) return;
        $this -> answer ["by"] = $this -> data -> get ("by");
        $this -> answer ["count"] = 1;
    }

    protected function exists ()
    {
        $driver_id = $this -> data -> get ("driver_id");
        $query =
            "SELECT COUNT(*)
               FROM drivers
              WHERE id = '" . $driver_id . "'";
        if ($this -> db -> scalar ($query) == "0")
        {
            $this -> data -> error (
                "Driver #" .
                $driver_id .
                " not found");
            return false;
        }
        return true;
    }
}