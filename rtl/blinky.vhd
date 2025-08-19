library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blinky is
  generic (
    G_COUNTER_MAX : natural := 49_999_999  -- toggles at 1 Hz with 100 MHz clk
  );
  port (
    clk : in  std_logic;
    rst : in  std_logic := '0';
    led : out std_logic
  );
end entity;

architecture rtl of blinky is
  signal counter : unsigned(31 downto 0) := (others => '0');
  signal led_r   : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        counter <= (others => '0');
        led_r   <= '0';
      else
        if counter = to_unsigned(G_COUNTER_MAX, counter'length) then
          counter <= (others => '0');
          led_r   <= not led_r;
        else
          counter <= counter + 1;
        end if;
      end if;
    end if;
  end process;
  led <= led_r;
end architecture;

