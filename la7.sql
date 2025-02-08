
SET SERVEROUTPUT ON
DECLARE

qty_available stock_detail.qty_avl %type;
p_no stock_detail.pno %type:=&pn;
qty_purchased stock_detail.qty_avl %type := &qty;
LOW_STOCK EXCEPTION;
BEGIN
SELECT QTY_AVL INTO qty_available FROM STOCK_DETAIL WHERE PNO = p_no;
IF qty_purchased < qty_available THEN
UPDATE STOCK_DETAIL SET QTY_AVL = QTY_AVL - qty_purchased WHERE PNO = p_no;
COMMIT;
DBMS_OUTPUT.PUT_LINE('Purchase successful '|| qty_purchased || ' ' || p_no || ' product(s) purchased.');
ELSE
RAISE LOW_STOCK;
END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Product not found.');
WHEN LOW_STOCK THEN
DBMS_OUTPUT.PUT_LINE('NO SUFFICIENT STOCK.');
END ;
/