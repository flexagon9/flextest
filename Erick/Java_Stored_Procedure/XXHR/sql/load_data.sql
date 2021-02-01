BEGIN
  -- stock items
  scott.po_mgr.add_stock_item(2010, 'camshaft', 245.00);
  scott.po_mgr.add_stock_item(2011, 'connecting rod', 122.50);
  scott.po_mgr.add_stock_item(2012, 'crankshaft', 388.25);
  scott.po_mgr.add_stock_item(2013, 'cylinder head', 201.75);
  scott.po_mgr.add_stock_item(2014, 'cylinder sleeve', 73.50);
  scott.po_mgr.add_stock_item(2015, 'engine bearning', 43.85);
  scott.po_mgr.add_stock_item(2016, 'flywheel', 155.00);
  scott.po_mgr.add_stock_item(2017, 'freeze plug', 17.95);
  scott.po_mgr.add_stock_item(2018, 'head gasket', 36.75);
  scott.po_mgr.add_stock_item(2019, 'lifter', 96.25);
  scott.po_mgr.add_stock_item(2020, 'oil pump', 207.95);
  scott.po_mgr.add_stock_item(2021, 'piston', 137.75);
  scott.po_mgr.add_stock_item(2022, 'piston ring', 21.35);
  scott.po_mgr.add_stock_item(2023, 'pushrod', 110.00);
  scott.po_mgr.add_stock_item(2024, 'rocker arm', 186.50);
  scott.po_mgr.add_stock_item(2025, 'valve', 68.50);
  scott.po_mgr.add_stock_item(2026, 'valve spring', 13.25);
  scott.po_mgr.add_stock_item(2027, 'water pump', 144.50);

  -- customers
  scott.po_mgr.add_customer(101, 'A-1 Automotive', '4490 Stevens Blvd',
    'San Jose', 'CA', '95129', '408-555-1212');
  scott.po_mgr.add_customer(102, 'AutoQuest', '2032 America Ave',
    'Hayward', 'CA', '94545', '510-555-1212');
  scott.po_mgr.add_customer(103, 'Bell Auto Supply', '305 Cheyenne Ave',
    'Richardson', 'TX', '75080', '972-555-1212');
  scott.po_mgr.add_customer(104, 'CarTech Auto Parts', '910 LBJ Freeway',
    'Dallas', 'TX', '75234', '214-555-1212');
  
  -- orders
  scott.po_mgr.enter_order(30501, 103, '14-SEP-1998', '21-SEP-1998',
    '305 Cheyenne Ave', 'Richardson', 'TX', '75080');
  scott.po_mgr.add_line_item(01, 30501, 2011, 5, 0.02);
  scott.po_mgr.add_line_item(02, 30501, 2018, 25, 0.10);
  scott.po_mgr.add_line_item(03, 30501, 2026, 10, 0.05);

  scott.po_mgr.enter_order(30502, 102, '15-SEP-1998', '22-SEP-1998',
    '2032 America Ave', 'Hayward', 'CA', '94545');
  scott.po_mgr.add_line_item(01, 30502, 2013, 1, 0.00);
  scott.po_mgr.add_line_item(02, 30502, 2014, 1, 0.00);

  scott.po_mgr.enter_order(30503, 104, '15-SEP-1998', '23-SEP-1998',
    '910 LBJ Freeway', 'Dallas', 'TX', '75234');
  scott.po_mgr.add_line_item(01, 30503, 2020, 5, 0.02);
  scott.po_mgr.add_line_item(02, 30503, 2027, 5, 0.02);
  scott.po_mgr.add_line_item(03, 30503, 2021, 15, 0.05);
  scott.po_mgr.add_line_item(04, 30503, 2022, 15, 0.05);

  scott.po_mgr.enter_order(30504, 101, '16-SEP-1998', '23-SEP-1998',
    '4490 Stevens Blvd', 'San Jose', 'CA', '95129');
  scott.po_mgr.add_line_item(01, 30504, 2025, 20, 0.10);
  scott.po_mgr.add_line_item(02, 30504, 2026, 20, 0.10);

  COMMIT;
END;