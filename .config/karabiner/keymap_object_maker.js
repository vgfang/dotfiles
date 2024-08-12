const fs = require("node:fs");

const keymap = [
  // left hand actions
  ["q", "escape"],
  ["x", "delete_forward"],
  ["z", "delete_or_backspace"],
  // ["v", "return_or_enter"],

  // right half navigation
  ["h", "left_arrow"],
  ["j", "down_arrow"],
  ["k", "up_arrow"],
  ["l", "right_arrow"],

  // right hand actions
  ["semicolon", "escape"],
  ["n", "delete_or_backspace"],
  ["m", "return_or_enter"],

  // symbols
  ["w", "comma"],
  ["e", "period"],
  ["o", "quote"],
  ["u", "hyphen"],
  ["i", "equal_sign"],
  ["y", "backslash"],
  ["c", "grave_accent_and_tilde"],
  ["a", "9"],
  ["s", "0"],
  ["d", "open_bracket"],
  ["f", "close_bracket"],
];

function formatToObject(k1, k2) {
  return {
    conditions: [
      {
        name: "caps_arrows_mode",
        type: "variable_if",
        value: 1,
      },
    ],
    from: {
      key_code: k1,
      modifiers: {
        optional: ["any"],
      },
    },
    to: [
      {
        key_code: k2,
      },
    ],
    type: "basic",
  };
}

const output = keymap.map((keypair) => {
  return formatToObject(keypair[0], keypair[1]);
});

output.unshift({
  from: {
    key_code: "caps_lock",
    modifiers: {
      optional: ["any"],
    },
  },
  to: [
    {
      set_variable: {
        name: "caps_arrows_mode",
        value: 1,
      },
    },
  ],
  to_after_key_up: [
    {
      set_variable: {
        name: "caps_arrows_mode",
        value: 0,
      },
    },
  ],
  to_if_alone: [
    {
      set_variable: {
        name: "caps_arrows_mode",
        value: 1,
      },
    },
  ],
  type: "basic",
});

fs.writeFile("keymap_object.json", JSON.stringify(output), "utf-8", (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log("Succesfully generated file.");
  }
});
