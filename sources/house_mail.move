/// Module: house_mail

module house_mail::house_mail;

use std::string::{String};

public struct House has key {
    id: UID,
    window: bool,
    door: bool,
    mail_box: vector<Mail>
}

public struct Mail has key, store {
    id: UID,
    content: String
}

public struct HouseCap has key, store {
    id: UID
}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

fun init(ctx: &mut TxContext) {
    let house = House {
        id: object::new(ctx),
        window: false,
        door: false,
        mail_box: vector[Mail]()
    }

    let house_cap = HouseCap { id: object::new(ctx) }

    transfer::share_object(house)
    transfer::transfer(house_cap, ctx.sender())
}

