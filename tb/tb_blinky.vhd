library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_blinky is
  generic (
    runner_cfg : string
  );
end entity;

architecture tb of tb_blinky is
  constant CLK_PERIOD : time := 10 ns; -- 100 MHz
  signal clk   : std_logic := '0';
  signal rst   : std_logic := '0';
  signal led   : std_logic;
begin
  clk <= not clk after CLK_PERIOD/2;

  -- Use tiny divider for sim speed
  dut: entity work.blinky
    generic map (
      G_COUNTER_MAX => 9
    )
    port map (
      clk => clk,
      rst => rst,
      led => led
    );

  main : process
  begin
    test_runner_setup(runner, runner_cfg);
    rst <= '1';
    wait for 5*CLK_PERIOD;
    rst <= '0';

    -- Observe a few toggles
    wait for 200*CLK_PERIOD;
    check_true(led'last_event > 0 ns, "LED toggled at least once");

    test_runner_cleanup(runner);
    wait;
  end process;
end architecture;

