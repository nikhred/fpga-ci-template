library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  port (
    clk100 : in  std_logic;
    led0   : out std_logic
  );
end entity;

architecture rtl of top_level is
  component blinky is
    generic (
      G_COUNTER_MAX : natural := 49_999_999
    );
    port (
      clk : in  std_logic;
      rst : in  std_logic := '0';
      led : out std_logic
    );
  end component;
begin
  u_blinky: blinky
    generic map (
      G_COUNTER_MAX => 49_999_999
    )
    port map (
      clk => clk100,
      rst => '0',
      led => led0
    );
end architecture;

