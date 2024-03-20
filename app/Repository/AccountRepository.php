<?php

namespace App\Repository;

use App\Models\Account;

class AccountRepository
{
    public function store(array $data): Account
    {
        $account = new Account($data);
        $account->save();
        $account->refresh();
        return $account;
    }
}
